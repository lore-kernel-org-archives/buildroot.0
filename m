From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Aug 2019 15:56:37 +0200
Subject: [Buildroot] [git commit] package/gcc: drop negative conditions
 on C-SKY for older versions
In-Reply-To: <CAJF2gTQrzxpWDx+=-rRe+=Jiz_J5u+-FvQMQLGMX7dYA5Q=70g@mail.gmail.com>
References: <20190801081630.42287811EE@busybox.osuosl.org>
 <CAJF2gTQrzxpWDx+=-rRe+=Jiz_J5u+-FvQMQLGMX7dYA5Q=70g@mail.gmail.com>
Message-ID: <35361c67-90cc-06df-34a2-912a2506c33a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/08/2019 05:38, Guo Ren wrote:
> Hello Peter,
> 
> On Fri, Aug 2, 2019 at 12:00 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>>
>> commit: https://git.buildroot.net/buildroot/commit/?id=f9d70202c1e09a7a02645638762f60434fd73051
>> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>
>> Now that the C-SKY architecture requires gcc-9, we can drop the special
>> conditions on the individual older versions.
> In fact, we still use gcc-6.3 on github/c-sky/gcc. GCC-9 is not
> recommended for using.

 As Yann already explained: this commit doesn't change anything about which GCC
versions you can select for C-SKY. You still have the option of
github/c-sky/gcc-6.3 or gcc-9, and the first one is the default. The only thing
this commit does is to use a simpler way of making sure that GCC < 9 can't be
selected for C-SKY.

 Regards,
 Arnout
