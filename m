From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 25 Feb 2016 12:53:58 +0100
Subject: [Buildroot] [PATCH v2 3/5] COPYING: add exception about patch
 licensing
In-Reply-To: <8737shxdjv.fsf@dell.be.48ers.dk>
References: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
 <1454365196-26319-4-git-send-email-luca@lucaceresoli.net>
 <20160203230208.GB3428@free.fr> <56BBBB2A.1060706@mind.be>
 <56C750A1.5050908@lucaceresoli.net> <8737shxdjv.fsf@dell.be.48ers.dk>
Message-ID: <56CEEB56.3040303@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 25/02/2016 11:57, Peter Korsgaard wrote:
>>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:
> 
> Hi,
> 
>  > Here's what I've been able to come up with so far. It's basically:
>  > - the sum of the present thread, plus
>  > - a reduced and modified version of the preamble suggested in the
>  >   GNU GPL itself (section "How to Apply These Terms to Your New
>  >   Programs"), plus
>  > - the statement that BR is GPLv2+ except where differently stated,
>  >   as Arnout suggested.
> 
>  > I'm sure this needs further discussion and improvements.
> 
>  > -------------------------8<----------------------
> 
>  > With the exceptions below, Buildroot is	distributed under the terms of
>  > the GNU General Public License, reproduced below; either version 2 of
>  > the License, or (at your option) any later version.
> 
>  > Some files in Buildroot contain a different license statement. Those
>  > files are licensed under the license contained in the file itself.
> 
>  > Buildroot also bundles patch files, which are applied to the sources
>  > of the various packages. Those patches are not covered by the license
>  > of Buildroot. Instead, they are covered by the license of the software
>  > to which the patches are applied. When said software is available
>  > under multiple licenses, the Buildroot patches are only provided under
>  > the publicly accessible licenses.
> 
> This sounds good to me. Do anyone disagree or can this be committed to
> master?

Given your approval I just sent v3 with the above text as-is, so anybody
can formally Ack/Nack and you can apply it without manual copy-pasting.

-- 
Luca
