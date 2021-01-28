From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 21:16:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/gerbera: needs gcc >= 8
In-Reply-To: <20210127063342.2754715-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 27 Jan 2021 07:33:42 +0100")
References: <20210127063342.2754715-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9bgzujm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > std::filesystem is required since version 1.5.0:
 > https://github.com/gerbera/gerbera/issues/849

 > Fixes:
 >  - http://autobuild.buildroot.org/results/759c875ee8ab0447cd735c22f89fa127cb8c427c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
