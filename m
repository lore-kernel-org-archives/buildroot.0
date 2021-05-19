From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 09:34:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/jquery-validation: security
 bump to version 1.19.3
In-Reply-To: <20210516093422.3768746-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 16 May 2021 11:34:22 +0200")
References: <20210516093422.3768746-1-fontaine.fabrice@gmail.com>
 <20210516093422.3768746-2-fontaine.fabrice@gmail.com>
Message-ID: <871ra3gorv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-21252: The jQuery Validation Plugin provides drop-in
 > validation for your existing forms. It is published as an npm package
 > "jquery-validation". jquery-validation before version 1.19.3 contains
 > one or more regular expressions that are vulnerable to ReDoS (Regular
 > Expression Denial of Service).

 > Update hash of README.md due to changes not related to license

 > https://github.com/jquery-validation/jquery-validation/releases/tag/1.19.3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
