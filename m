From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2020 12:59:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-markdown2: fix
 CVE-2020-11888
In-Reply-To: <20200511192237.122291-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 11 May 2020 21:22:37 +0200")
References: <20200511192237.122291-1-fontaine.fabrice@gmail.com>
Message-ID: <873685mn9u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > python-markdown2 through 2.3.8 allows XSS because element names are
 > mishandled unless a \w+ match succeeds. For example, an attack might use
 > elementname@ or elementname- with an onclick attribute.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
