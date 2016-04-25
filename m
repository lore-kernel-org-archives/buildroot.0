From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Apr 2016 22:46:38 +0200
Subject: [Buildroot] Fwd:  [RPi3] Trying to test WiFi On Raspberr Pi 3
In-Reply-To: <CALtfCQaW+aMMoXsm=Fc9r9rPbzsEwYLRbk1DvjN5wVsfzTOMfA@mail.gmail.com>
 (Oscar Gomez Fuente's message of "Mon, 25 Apr 2016 22:20:01 +0200")
References: <CALtfCQYZXSFWSv8m5y+BkwKx-iOPrgYpZypvmtk_i2MLZebeiw@mail.gmail.com>
 <CALtfCQZ9GAfL3qYuJK97XAETVhE4PNnr+R6aL-2JBC6UrRTn1w@mail.gmail.com>
 <5719EB20.6090107@armadeus.com>
 <CALtfCQb5w8ygEpiqE=_RVOzF7FpC62uF=TK7Fau7+xZ3MZMo-g@mail.gmail.com>
 <CALtfCQaW+aMMoXsm=Fc9r9rPbzsEwYLRbk1DvjN5wVsfzTOMfA@mail.gmail.com>
Message-ID: <87h9epo1qp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:

 > Hi,
 > I've just solved the problem. First of all, you have to download the
 > firmware from this git repository: https://github.com/OpenELEC/wlan-firmware

 > Then you have to select the following packages on buildroot:  crda,
 > iw,  wireless-regdb and wpa_supplicant.

Thanks.

 > So It will be very useful to add the files brcmfmac43430-sdio.bin and
 > brcmfmac43430-sdio.txt to the linux-firmware package.

I don't think these are available in linux-firmware. It seems like we
need to get them from rpi-firmware-nonfree:

https://github.com/RPi-Distro/firmware-nonfree/tree/master/brcm80211/brcm

-- 
Bye, Peter Korsgaard
