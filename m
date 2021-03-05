From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 5 Mar 2021 20:29:31 +0100
Subject: [Buildroot] [PATCH 0/2] package/belle-sip: work around bug 99410
In-Reply-To: <b67310b8-e253-fb2e-234a-5947d0b17002@benettiengineering.com>
References: <20210305151529.3477575-1-giulio.benetti@benettiengineering.com>
 <b67310b8-e253-fb2e-234a-5947d0b17002@benettiengineering.com>
Message-ID: <dd3d951c-39b6-7aa0-376a-d1f9902d61a7@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3/5/21 8:23 PM, Giulio Benetti wrote:
> Sorry but this patchset is not correct, that is not a gcc bug but a
> binutils bug, specifically:
> https://sourceware.org/bugzilla/show_bug.cgi?id=27243
> 
> So going to rename and send a v2 patchset.

I was too in hurry, this is correct as I've mentioned here:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410

Sorry for the noise

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
