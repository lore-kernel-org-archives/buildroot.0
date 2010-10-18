From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 18 Oct 2010 15:38:01 -0300
Subject: [Buildroot] [pull request] libtool enhancement v2
In-Reply-To: <20101010001237.755b5743@surf>
References: <1286621574-10872-1-git-send-email-llandwerlin@gmail.com>
	<20101010001237.755b5743@surf>
Message-ID: <4CBC9409.9000709@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/09/10 19:12, Thomas Petazzoni wrote:

> On Sat,  9 Oct 2010 12:52:47 +0200
> llandwerlin at gmail.com wrote:
> 
>> Here is a second version of a patch set mostly from Martin Banky to
>> support libtool patching depending on the libtool script version. This
>> also bumps libtool to version 2.2.10, so we can autoreconfigure
>> packages depending on libtool 2.2 versions (gtk+, glib, etc...).
>>
>> You can pull from :
>>     git://git.potipota.net/buildroot martins-libtool
> 
> Not tested, but on the principle:
> 
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Tested with a couple arm/powerpc builds, no issues so far.
