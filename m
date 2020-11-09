From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Nov 2020 21:21:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/postgresql: drop unrecognized
 variables
In-Reply-To: <20201108172347.63740-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 8 Nov 2020 18:23:47 +0100")
References: <20201108172347.63740-1-fontaine.fabrice@gmail.com>
Message-ID: <87k0uuqo0u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > pgac_cv_snprintf_long_long_int_modifier has been dropped since version
 > 11.0 and
 > https://github.com/postgres/postgres/commit/b929614f5e867c70721b3db31d3dec6cb35e1eb5

 > pgac_cv_snprintf_size_t_support has been dropped since version 12.0 and
 > https://github.com/postgres/postgres/commit/96bf88d52711ad3a0a4cc2d1d9cb0e2acab85e63

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
