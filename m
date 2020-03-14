From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:25:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/shellinabox: fix CVE-2018-16789
In-Reply-To: <20200229225511.4079011-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Feb 2020 23:55:11 +0100")
References: <20200229225511.4079011-1-fontaine.fabrice@gmail.com>
Message-ID: <871rpussiv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libhttp/url.c in shellinabox through 2.20 has an implementation flaw in
 > the HTTP request parsing logic. By sending a crafted multipart/form-data
 > HTTP request, an attacker could exploit this to force shellinaboxd into
 > an infinite loop, exhausting available CPU resources and taking the
 > service down.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
