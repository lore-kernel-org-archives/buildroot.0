From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2021 11:09:02 +0100
Subject: [Buildroot] [PATCH 3/3] package/intel-mediadriver: fix option
In-Reply-To: <20210131133200.3976386-3-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 31 Jan 2021 14:32:00 +0100")
References: <20210131133200.3976386-1-fontaine.fabrice@gmail.com>
 <20210131133200.3976386-3-fontaine.fabrice@gmail.com>
Message-ID: <87r1m0nlq9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Replace INSTALL_DRIVERS_SYSCONF by INSTALL_DRIVER_SYSCONF which is the
 > correct name since version 18.2.0 and
 > https://github.com/intel/media-driver/commit/81796c8a9e44b878e26064c898e0f4730e8220cf

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
