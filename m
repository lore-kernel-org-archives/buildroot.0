From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 09:16:01 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsockets : bump to v1.7.2
In-Reply-To: <56D63448.4080202@proximus.be>
References: <1456871425-26152-1-git-send-email-sagaert.johan@proximus.be>
 <20160301233457.2dae9d21@free-electrons.com>
 <56D63448.4080202@proximus.be>
Message-ID: <20160302091601.7076cc01@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan,

(Please keep the mailing list in Cc: when replying, thanks!)

On Wed, 2 Mar 2016 01:31:04 +0100, Johan Sagaert wrote:

> Just added some comment,
> Looks like the CMakeLists.txt has been seriously reworked.
> Did not encounter anything strange while building and using the new 
> version of the lib.

The patch was originally introduced to make sure that libwebsockets
would build fine in a BR2_STATIC_LIB=y configuration. Could you verify
that this is still the case with your update?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
