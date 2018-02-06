From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 6 Feb 2018 13:37:53 -0500
Subject: [Buildroot] [PATCH v2 1/1] 2017.11.x: fix refpolicy build
 failure
In-Reply-To: <87zi4mrpw5.fsf@dell.be.48ers.dk>
References: <20180206171640.12055-1-aduskett@gmail.com>
 <87zi4mrpw5.fsf@dell.be.48ers.dk>
Message-ID: <CAFSsvmp+DEtSc5DkhkqD0tEPe_jTMF8cRrRK_wpOyCKvw4K99g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter;

On Tue, Feb 6, 2018 at 12:26 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:
>
>  > Add a patch to fix the fallthrough.
>  > Taken from upstream:
>  > https://github.com/TresysTechnology/refpolicy/commit/89b53fafa9904ba7a3df2ad94d01a485eae5366f
>
>  > Fixes:
>  > http://autobuild.buildroot.net/results/54e240243aba31da33a2cbecdcc234b44f24dcf7
>  > Signed-off-by: Adam Duskett <aduskett@gmail.com>
>  > ---
>  > Changes v1 -> v2:
>  >   - Added upstream commit link to the patch notes (Matthew Weber)
>  >   - Changed patch to full upstream patch.
>
> Ehh, isn't this already fixed by this:
> https://git.buildroot.net/buildroot/commit/?h=2017.11.x&id=c8eea94905a0dc2851e92673a3a7697eb5dc4355
>
> --
> Bye, Peter Korsgaard
I didn't see that you had submitted and approved this patch.
This patch was submitted after your initial comment to the first patch.
