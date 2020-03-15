From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:45:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/proftpd: add mod_cap option
In-Reply-To: <20200307232735.2425986-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 8 Mar 2020 00:27:35 +0100")
References: <20200307232735.2425986-1-fontaine.fabrice@gmail.com>
Message-ID: <874kuplww0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add an option to enable or disable mod_cap and select libcap accordingly
 > instead of using bundled libcap which raise a build failure with headers
 > < 4.3 due to PR_CAP_AMBIENT and will be removed in version 1.3.7:
 > https://github.com/proftpd/proftpd/commit/8c845703fcf2c7978614784126bd074ffc4477f9

 > Fixes:
 >  - http://autobuild.buildroot.org/results/4d680d8204bdf1f3deec2c3eeb9a2d9e6eabe4d5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
