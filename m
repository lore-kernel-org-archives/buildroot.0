From: Babarovic Ivica <ivica.babarovic@asist.si>
Date: Fri, 19 Oct 2007 10:13:19 +0200
Subject: [Buildroot] svn At revision 20289 breakage
In-Reply-To: <008201c81224$6c96bd80$01c4af0a@Glamdring>
References: <4717A47F.4000908@asist.si>
	<4717C93A.3080401@promwad.com><0c3501c811c4$63522850$01c4af0a@Glamdring><4717D0BA.1050300@promwad.com><0c5901c811c6$8aecca30$01c4af0a@Glamdring>
	<4718510D.5030602@asist.si>
	<008201c81224$6c96bd80$01c4af0a@Glamdring>
Message-ID: <4718671F.3040005@asist.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
>
> It is always the case that you have to provide a ".config" file for 
> linux.
>
> For some lucky souls Buildroot will do it for you.
> This is when there is an appropriate definition somewhere in the 
> target directory,
> and if you have supplied the right kernel.
Well, I guess I was lucky until now. I never provided any kernel or 
.config files.
I still fail to see why this is important for buildroot build. Kernel 
headers?

I have a .config file from a kernel I build. Should I put that into 
buildroot process?
What differences would it make?
>
> For some unlucky souls, they now have an option to start a "make xconfig"
> to get a window allowing them to configure things instead of having a 
> failed build.
>
