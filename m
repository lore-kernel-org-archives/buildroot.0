From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jun 2013 22:12:17 +0200
Subject: [Buildroot] Eclipse does not see Toolchain
In-Reply-To: <CAGBa4kARr8ho40ADxxpitKYTW-M4UVET0sDPgr5VP4Zw6dB2iw@mail.gmail.com>
References: <CAGBa4kARr8ho40ADxxpitKYTW-M4UVET0sDPgr5VP4Zw6dB2iw@mail.gmail.com>
Message-ID: <20130614221217.16c738af@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Scott Kelly,

On Thu, 13 Jun 2013 09:14:07 +1000, Scott Kelly wrote:

> I'm using a clean install of Ubuntu 12.04, latest Buildroot (2013.05),
> Eclipse Juno SR2 CDT and have installed the Eclipse Buildroot plugin from
> release URL (seems to be the correct latest 2.1 release). I perform my
> Buildroot build with the "Register Eclipse Plugin" option checked and
> indeed the integration file (~/.buildroot-eclipse.toolchains) is created.
> 
> But, for the life of me, I can't work out why the toolchain is not detect
> or listed by Eclipse. I've tried with both internal and external Toolchains
> but no difference.
> 
> Does anyone have any suggestions as to where I can look for clues as to
> what the problem might be. I've checked the Eclipse log file but am not
> sure what I am looking for and didn't really find anything anyway.

Thanks for your report. This is quite strange, as the plugin is working
for us. The only checks that Eclipse is doing is to verify that the
compiler path points to an existing file.

Could you give us your Buildroot .config, the generated
~/.buildroot-eclipse.toolchains, and verify by yourself that the
compiler pointed by ~/.buildroot-eclipse.toolchains indeed exists?

I suppose you've verified that you don't see the Buildroot toolchain
when trying to create a C Executable project, as shown in
https://raw.github.com/mbats/eclipse-buildroot-bundle/master/doc/images/eclipse_new_project_toolchain.png ?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
