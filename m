From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 24 Sep 2009 12:42:03 -0300
Subject: [Buildroot] Problem with defconfig
In-Reply-To: <4ABB4F13.9060102@mimc.co.uk>
References: <4AB9F39B.4090300@mimc.co.uk> <874oqurm9z.fsf@macbook.be.48ers.dk>
	<4AB9FE2D.1080009@mimc.co.uk> <87my4lrke1.fsf@macbook.be.48ers.dk>
	<4ABA02F3.6020706@mimc.co.uk> <87eipxrfz0.fsf@macbook.be.48ers.dk>
	<4ABB4F13.9060102@mimc.co.uk>
Message-ID: <d6cda7730909240842r2fc6d565hde24128fb166dd55@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Sep 24, 2009 at 7:50 AM, Mark Jackson <mpfj-list@mimc.co.uk> wrote:
> Peter Korsgaard wrote:
>
> <snip>
>
>>
>> %_defconfig: $(CONFIG)/conf
>> ? ? ? ? cp $(shell find ./target/ -name $@) .config
>> ? ? ? ? -@$(MAKE) oldconfig
>>
>> So I don't get it why it doesn't trigger for you. Does a simple 'make
>> blah_defconfig' work for you?
>
> The makefile seems to be looking for the file, but can't find it:-
>

I didn't check, but I do remember that there was a clean up where the
atngw100 variations were removed. I think there is only
atngw100_defconfig now.

Kind Regards,
    Thiago A. Correa
