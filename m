From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Apr 2021 21:12:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/network-manager: security bump
 to version 1.22.16
In-Reply-To: <20210409164319.3326427-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 9 Apr 2021 18:43:19 +0200")
References: <20210409164319.3326427-1-fontaine.fabrice@gmail.com>
Message-ID: <87eefj9sqt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > ifcfg-rh: handle "802-1x.{,phase2-}ca-path". Otherwise setting this
 > property silently fails and a profile might accidentally not perform
 > any authentication (CVE-2020-10754).

ifcfg-rh sounds like something specific to Redhat distributions? I guess
it isn't used in Buildroot?

-- 
Bye, Peter Korsgaard
