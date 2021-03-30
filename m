From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Mar 2021 08:18:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-lxml: security bump to
 version 4.6.3
In-Reply-To: <20210329203341.303201-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 29 Mar 2021 22:33:41 +0200")
References: <20210329203341.303201-1-fontaine.fabrice@gmail.com>
Message-ID: <871rbxdv0g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-28957: lxml 4.6.2 allows XSS. It places the HTML action
 > attribute into defs.link_attrs (in html/defs.py) for later use in input
 > sanitization, but does not do the same for the HTML5 formaction
 > attribute.

 > https://github.com/lxml/lxml/blob/lxml-4.6.3/CHANGES.txt

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
