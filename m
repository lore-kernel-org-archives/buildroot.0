From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Oct 2018 12:52:37 +0100
Subject: [Buildroot] [PATCH 1/1] libxmlrpc: bump to version 1.43.08
In-Reply-To: <20181031114142.26274-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 31 Oct 2018 12:41:42 +0100")
References: <20181031114142.26274-1-fontaine.fabrice@gmail.com>
Message-ID: <87in1ibaey.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Remove first patch and pass CC_FOR_BUILD and other variables in
 >   LIBXMLRPC_CONF_OPTS instead of LIBXMLRPC_CONF_ENV because a similar
 >   solution is already in version thanks to
 >   https://sourceforge.net/p/xmlrpc-c/code/2905
 > - Remove second patch (already in version thanks to
 >   https://sourceforge.net/p/xmlrpc-c/code/2908)
 > - Remove third path (already in version thanks to
 >   https://sourceforge.net/p/xmlrpc-c/code/2909)
 > - Add hash for license file

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
