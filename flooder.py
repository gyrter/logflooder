#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  flooder.py
#
#  Copyright 2021 Nikolay Bogdanov <nikolay.bogdanov@flant.com>
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#
#

from time import sleep
import traceback
import logging
from os import getenv
from random import randint

RND=getenv("RND", 5)
DELAY=getenv("DELAY", 10)
NAMESPACE=getenv("KUBERNETES_NAMESPACE", "default")

logging.basicConfig(format="%(asctime)s {} %(message)s".format(NAMESPACE), datefmt='%m %b %Y %H:%M:%S', level=logging.DEBUG)

def test0():
    logging.info("Hello")

def test1(a, b):
    test1_(a, b)

def test1_(a, b):
    test1__(a, b)

def test1__(a, b):
    logging.info("Some math result %i", a/b)

def main(args):
    while True:
        test0()
        sleep(DELAY + randint(0, RND))
        test1(10, 2)
        sleep(DELAY + randint(0, RND))
        try:
            test1(5, 0)
        except:
            traceback.print_exc()
        sleep(DELAY + randint(0, RND))
    return 0

if __name__ == '__main__':
    import sys
    sys.exit(main(sys.argv))
