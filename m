From: Tal Lubko <tallubko@yahoo.com>
Date: Sun, 5 Oct 2014 01:07:29 -0700
Subject: [Buildroot] How to deploy Buildroot's crosscompile toolchain???
In-Reply-To: <20141005063835.GH7164@waldemar-brodkorb.de>
References: <1412490777.5471.YahooMailNeo@web122103.mail.ne1.yahoo.com>
 <20141005063835.GH7164@waldemar-brodkorb.de> 
Message-ID: <1412496450.44055.YahooMailNeo@web122105.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar

Thanks for your help.
So, is there a recommendation as to how to deploy toolchain to other machines?

Tal





________________________________
 From: Waldemar Brodkorb <wbx@openadk.org>
To: Tal Lubko <tallubko@yahoo.com> 
Cc: "buildroot at busybox.net" <buildroot@busybox.net> 
Sent: Sunday, October 5, 2014 9:38 AM
Subject: Re: [Buildroot] How to deploy Buildroot's crosscompile toolchain???
 

Hi,
Tal Lubko wrote,


> Hi
> 
> I've wanted to ask what is the right way to build and deploy Buildroot's 
> toolchain to other machines?
> These machines don't have Buildroot to build the toolchain.
> 
> Currently (being ignorant about the right way to do it), after building the 
> toolcahin, I'm just making a tar of output/host and copy it to other machine.
> There I'm untarring it to some directory and starting to cross compile...
> 
> Things seemed to be working when I've worked with an External toolchain (
> Sourcery CodeBench). However when I've switched to Buildroot's toolchain, I got
> a message about missing libmpc.so.3. Then I've started to wonder what is the
> right way to build and deploy the toolchain.
> 
> When I run "gcc -v"
> I get a lot parameters like prefix, sysroot and more that show the directory it
> was build in:
> /home/tal/buildroot/2014.08/...
> 
> Which leads me again to think that I'm doing something wrong...
> Any help will be appreciated.

I am not 100% sure, but I think buildroot internal toolchains are
not relocatable. At least not via a relative sysroot directory.

best regards
Waldemar
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141005/b17b0449/attachment.html>
