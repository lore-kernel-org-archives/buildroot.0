From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 01 Apr 2018 18:51:26 -0300
Subject: [Buildroot] [PATCH v2 18/37] docs/manual: add check-package to
 "Tips and tricks"
References: <20180401230349.7f6f7661@windsurf>
Message-ID: <5ac1545e44837_412b2af089f098909005@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Apr 01, 2018 at 06:03 PM, Thomas Petazzoni wrote:

> On Sun, 01 Apr 2018 17:53:05 -0300, Ricardo Martincoski wrote:
> 
>> > I'm not sure to understand what you mean by "does not check package
>> > infra types". Do you mean that the code in package/pkg-*.mk is not
>> > checked ? Or that it doesn't check the $(eval $(autotools-package))
>> > line at the end of every package ?  
>> 
>> I meant package/pkg-*.mk and similar files.
> 
> OK, so "infra types" is not really the right word to express that.

OK.

>> What I am trying to state is that the script does not validate the language of
>> any file in the tree or even any Makefile, it only checks for common mistakes in
> 
> I guess you wanted to say "does not validate the language of all files
> in the tree". Your formulation means that the tool is not validating
> any file!

Yes! I meant 'all files'.
Thank you for fixing while reading!

> """
> It does not check the files defining the package infrastructures and
> some other files containing similar common code.
> """

Much better. Thanks.

>> When you add a new package, be sure to test it in various conditions
>> (see xref:testing-package[]) and also check it for coding style
>> (see xref:check-package[]).
> 
> I like this one.

ACK.


Regards,
Ricardo
