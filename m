From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Jun 2018 16:29:46 +0200
Subject: [Buildroot] [PATCH 1/1] libxslt: security bump to version 1.3.2
In-Reply-To: <20180607180704.12441-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 7 Jun 2018 20:07:04 +0200")
References: <20180607180704.12441-1-fontaine.fabrice@gmail.com>
Message-ID: <87zi05bbc5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2017-5029
 > - Remove first patch (already in version)
 > - Add a dependency to host-pkgconf and remove libxml2 options: see
 >   https://github.com/GNOME/libxslt/commit/abf537ebb2296cd3ae89989a17b0e1b5c79db107
 > - Add hash for license file

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
