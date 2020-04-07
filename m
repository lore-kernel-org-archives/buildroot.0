From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 20:25:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/sdbusplus: needs C++17
In-Reply-To: <20200326203820.59678-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 26 Mar 2020 21:38:20 +0100")
References: <20200326203820.59678-1-fontaine.fabrice@gmail.com>
Message-ID: <874ktvp2zu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > sdbusplus needs C++17 since
 > https://github.com/openbmc/sdbusplus/commit/ca46b9d2e958d1e4b392265f656f782899c2de1d

 > This is not needed for host-sdbusplus as libsdbusplus is disabled on
 > host through --disable-libsdbusplus

 > Fixes:
 >  - http://autobuild.buildroot.org/results/65a4652e5b419f03ace109c4b3738e9b997cdabe

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
