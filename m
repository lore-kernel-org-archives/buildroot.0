From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Oct 2019 23:28:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/libyang: fix up the 'v' prefix
 in the version
In-Reply-To: <20191024181155.14819-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 24 Oct 2019 20:11:55 +0200")
References: <20191024181155.14819-1-fontaine.fabrice@gmail.com>
Message-ID: <87lft94yvj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > In order for the libyang version to match what is given by
 > release-monitoring.org, the 'v' prefix should be encoded in
 > LIBYANG_SITE and not LIBYANG_VERSION.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
