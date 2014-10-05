From: Tal Lubko <tallubko@yahoo.com>
Date: Sat, 4 Oct 2014 23:32:57 -0700
Subject: [Buildroot] How to deploy Buildroot's crosscompile toolchain???
Message-ID: <1412490777.5471.YahooMailNeo@web122103.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I've wanted to ask what is the right way to build and deploy Buildroot'stoolchain to other machines?
These machines don't have Buildroot to build the toolchain.

Currently (being ignorant about the right way to do it), after building the toolcahin, I'm just making a tar of output/host and copy it to other machine. There I'm untarring it to some directory and starting to cross compile...

Things seemed to be working when I've worked with an External toolchain (SourceryCodeBench). However when I've switched to Buildroot'stoolchain, I got a message about missing libmpc.so.3. Then I've started to wonder what is the right way to build and deploy the toolchain.

When I run "gcc-v"
I get a lot parameters like prefix, sysroot and more that show the directory it was build in:
/home/tal/buildroot/2014.08/...

Which leads me again to think that I'm doing something wrong...
Any help will be appreciated.

Thanks,
Tal
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141004/b0d48963/attachment.html>
