From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2021 19:08:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/luasyslog: needs host-luarocks
In-Reply-To: <20210127080745.2893492-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 27 Jan 2021 09:07:45 +0100")
References: <20210127080745.2893492-1-fontaine.fabrice@gmail.com>
Message-ID: <87zh0nlkz5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > host-luarocks is needed since bump to version 2.2.0 as the package is
 > now using autotools infrastructure instead of luarocks

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f6a9615e965905bdc0a1e62020e4b27d6653693f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
