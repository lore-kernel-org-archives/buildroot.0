From: Riccardo Raneri <flip79@gmail.com>
Date: Fri, 9 Feb 2018 09:41:07 +0100
Subject: [Buildroot] Audio drivers for Orange PI Zero on 4.15
Message-ID: <CADRL_XirL1OL6HnxdPv0LT1ecLV4=8OKgt3F52qxSfcXq81sFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Does sound work on kernel 4.15 or it's mandatory to switch to a previous
version?

My Orange PI Zero doesn't see any soundcard, even if I enabled alsactl,
alsautil and the device drivers for Allwinner SOCs:

 <*> Allwinner A10 Codec Support
Allwinner SUN8I audio codec
Allwinner sun8i Codec Analog Controls Support
Allwinner A10 I2S Support
Allwinner A10 SPDIF Support

Thanks,
Riccardo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180209/3cd0992a/attachment.html>
