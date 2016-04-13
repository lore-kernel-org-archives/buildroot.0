From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 19:01:28 -0300
Subject: [Buildroot] [PATCH 01/15] fs: add genimage infra
In-Reply-To: <20160413234530.502a4244@free-electrons.com>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460577820-32164-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570EBAE6.1080000@mind.be>
 <20160413234530.502a4244@free-electrons.com>
Message-ID: <CAAEAJfAR6FDfO7N_fM4SCYTJz0=zCVxEtTxfSJo7uJvbOpPGwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13 April 2016 at 18:45, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 13 Apr 2016 23:32:22 +0200, Arnout Vandecappelle wrote:
>
>>   Therefore, at least as a first step, I guess it's better to just move the
>> script to a common place, e.g. to package/genimage/post-image.sh. Let it take a
>> single argument for the genimage.cfg file, and add some documentation to the manual.
>
> As an after-thought, this seems like a good idea. This is really a very
> simple and minimal change, and is easy to do.
>

I realize this is a simple step forward, but I'm wondering if we can
sort out the open
questions around a proper genimage infra, and just go for the big
solution instead.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
