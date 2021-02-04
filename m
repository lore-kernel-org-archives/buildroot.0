From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Feb 2021 16:34:26 +0100
Subject: [Buildroot] [PATCH 2/2] package/chartjs: security bump to 2.9.4
In-Reply-To: <20210119154607.11101-2-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Tue, 19 Jan 2021 16:46:05 +0100")
References: <20210119154607.11101-1-patrickdepinguin@gmail.com>
 <20210119154607.11101-2-patrickdepinguin@gmail.com>
Message-ID: <8735ybg83h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Joeri Barbarien <joeri.barbarien@nokia.com>
 > CVE-2020-7746 (https://nvd.nist.gov/vuln/detail/CVE-2020-7746)

 >     The options parameter is not properly sanitized when it is processed.
 >     When the options are processed, the existing options (or the defaults
 >     options) are deeply merged with provided options. However, during this
 >     operation, the keys of the object being set are not checked, leading to
 >     a prototype pollution.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
