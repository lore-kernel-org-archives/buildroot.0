From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Feb 2015 07:05:50 +0100
Subject: [Buildroot] [PATCH 1/3] glibc: add version 2.21
In-Reply-To: <54D94BD4.50108@vanguardiasur.com.ar> (Ezequiel Garcia's message
 of "Mon, 09 Feb 2015 21:07:48 -0300")
References: <1423408027-49694-1-git-send-email-Vincent.Riera@imgtec.com>
 <1423408027-49694-2-git-send-email-Vincent.Riera@imgtec.com>
 <54D94BD4.50108@vanguardiasur.com.ar>
Message-ID: <87zj8m1etd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

Hi,

 > IMHO, you are missing this:

 > diff --git a/package/glibc/Config.in b/package/glibc/Config.in
 > index 37e108e..3fe0dd4 100644
 > --- a/package/glibc/Config.in
 > +++ b/package/glibc/Config.in
 > @@ -51,3 +51,4 @@ config BR2_GLIBC_VERSION_STRING
 >         default "2.19-svnr25243" if BR2_EGLIBC_VERSION_2_19
 >         default "2.19" if BR2_GLIBC_VERSION_2_19
 >         default "2.20" if BR2_GLIBC_VERSION_2_20
 > +       default "2.21" if BR2_GLIBC_VERSION_2_21

Indeed, will fix.

-- 
Bye, Peter Korsgaard
