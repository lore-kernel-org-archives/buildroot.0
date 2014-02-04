From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Feb 2014 17:54:13 +0100
Subject: [Buildroot] [PATCH] defconfigs: add sama5d3 support
In-Reply-To: <87zjm75533.fsf@dell.be.48ers.dk>
References: <1391093726-7569-1-git-send-email-ludovic.desroches@atmel.com>
 <87y51rl01m.fsf@dell.be.48ers.dk>
 <20140204112654.GD30185@ldesroches-Latitude-E6320>
 <87zjm7cae2.fsf@dell.be.48ers.dk>
 <20140204132117.GE30185@ldesroches-Latitude-E6320>
 <87zjm75533.fsf@dell.be.48ers.dk>
Message-ID: <52F11B35.7000707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/14 15:24, Peter Korsgaard wrote:
>>>>>> "Ludovic" == Ludovic Desroches <ludovic.desroches@atmel.com> writes:
> 
> Hi,
> 
>  > I understand this point of view and I am fine with it. But my concern
>  > is that some customers want something working out of the box. For
>  > instance, we often use devmem2 for debugging purpose or other tools
>  > such as i2c-tools. It is easier for us to have it in a defconfig
>  > file.
> 
>  > I am not trying to convince you to take this defconfig as is! Just to
>  > know if there is a way to provide specific packages? If not, it will
>  > be provided only in our buildroot-at91 repository. I am also fine
>  > with this, if the customer wants something out of the box then he'll
>  > have to use our repository. Otherwise he could use buildroot one.
> 
> I understand. We're been discussing something like this a few times
> (E.G. full blown "demo" defconfigs), but for now I prefer to keep the
> variant in buildroot minimal.

 However, we are OK with a minimal and a demo variant. So you can submit
one patch that builds a minimal config in configs/sama5d3_defconfig, and
a second patch that adds a demo defconfig in
configs/sama5d3_demo_multimedia_defconfig (it looks like you mainly add
multimedia packages, hence the name I chose, but you can take something
else of course).

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
