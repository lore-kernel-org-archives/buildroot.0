From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 17:32:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/poppler: add boost optional
 dependency
In-Reply-To: <20210119180542.497919-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 19 Jan 2021 19:05:42 +0100")
References: <20210119180542.497919-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9bh3tv8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > boost is an optional dependency which is enabled by default since
 > version 0.80.0 and
 > https://github.com/freedesktop/poppler/commit/355fd8d58ca0209284fe568b3add28f207e995c1

 > There is no cmake option to enable or disable this dependency

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
