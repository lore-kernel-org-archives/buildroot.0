From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 12:05:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/mono: fix build with powerpc
In-Reply-To: <CAPi7W83n=9b4yLYnKMrF2RUbALGvrYj0CCAQqBaYEm5P1hjq=w@mail.gmail.com>
 (Fabrice Fontaine's message of "Fri, 14 Feb 2020 17:57:07 +0100")
References: <20200214163851.2900799-1-fontaine.fabrice@gmail.com>
 <CA+TH9Vk2c-bJEuEa7csOw9dJFgNfoWsXNNcmGRtGi7sBezghqA@mail.gmail.com>
 <CAPi7W83n=9b4yLYnKMrF2RUbALGvrYj0CCAQqBaYEm5P1hjq=w@mail.gmail.com>
Message-ID: <87a75kjek9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 >> It's really worth to backport an upstream patch when we can wait for the next release?
 > It depends on when the release will happen. Is it planned before the
 > end of February?

If it is anyway an upstream patch and fixes build issues I don't see any
problem with adding it now - So committed, thanks.

-- 
Bye, Peter Korsgaard
