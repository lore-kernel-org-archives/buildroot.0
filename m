From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Apr 2021 12:17:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-lxml: security bump to
 version 4.6.3
In-Reply-To: <20210329203341.303201-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 29 Mar 2021 22:33:41 +0200")
References: <20210329203341.303201-1-fontaine.fabrice@gmail.com>
Message-ID: <87czvb7jur.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "fontaine.fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-28957: lxml 4.6.2 allows XSS. It places the HTML action
 > attribute into defs.link_attrs (in html/defs.py) for later use in input
 > sanitization, but does not do the same for the HTML5 formaction
 > attribute.

 > https://github.com/lxml/lxml/blob/lxml-4.6.3/CHANGES.txt

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
