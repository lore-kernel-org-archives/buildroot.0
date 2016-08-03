From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Aug 2016 21:18:11 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain: purge locales by default
In-Reply-To: <1470176380-11851-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 3 Aug 2016 00:19:38 +0200")
References: <1470176380-11851-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877fbxlkzw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Our current default is to keep all locales installed in
 > /usr/share/locale/. However, in practice, those locales take up a
 > significant amount of space, and most users do not need
 > locales. Therefore, it makes more sense to default to purging locales,
 > in order to keep only a few useful ones rather than keeping them all.

 > It helps in providing a small filesystem size by default, and still
 > allows advanced users who really need locales to tune their
 > configuration.

 > As an example, a very basic system with just util-linux enabled (not
 > even Busybox) weights 11 MB, including 6.4 MB of locales. With this new
 > default, the generated system is only 4.2 MB.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
