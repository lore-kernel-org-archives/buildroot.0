From: Jesse Cobra <jessecobra@gmail.com>
Date: Fri, 26 Jan 2018 01:27:12 +0000
Subject: [Buildroot] scanpypi package error adadfruit-ads1x15
Message-ID: <CACG401qs4wj83dGC4t++ZWQWCdax=-3KzEoHNNYzjUGBKTkhBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

building for pi zero w on ubuntu 14.04 32 bit buildroot 2017.02.9
<https://github.com/jumpnow/buildroot/commit/7da7a1f96f69b3dcd52af1d33d2b260d53af6bc3>

utils/scanpypi adafruit-ads1x15 -o package
buildroot package name for adafruit-ads1x15: python-adafruit-ads1x15
Package: python-adafruit-ads1x15
Fetching package adafruit-ads1x15
Downloading package adafruit-ads1x15 from
https://pypi.python.org/packages/14/e8/c9935e32f61e6562abea08cb704fcbfbb78b39bd1d20bb9b12eb4c2c820c/Adafruit_ADS1x15-1.0.2.tar.gz.
..
Traceback (most recent call last):
  File "utils/scanpypi", line 653, in <module>
    main()
  File "utils/scanpypi", line 604, in main
    package.load_setup()
  File "utils/scanpypi", line 247, in load_setup
    os.chdir(self.tmp_extract)
OSError: [Errno 2] No such file or directory:
'/tmp/scanpypi-wzvU4f/python-adafruit-ads1x15/Adafruit-ADS1x15-1.0.2'

Anyone point me in the right direction?

Regards,
Jesse
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180126/dd316be1/attachment.html>
