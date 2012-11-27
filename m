From: pritam.ghanghas at gmail.com <pritam.ghanghas@gmail.com>
Date: Tue, 27 Nov 2012 19:53:26 +0530
Subject: [Buildroot] adding network manager to a older buildroot
Message-ID: <CABTvgZh+PP_0vwb=ahsDi9PcjYe7DdST1GRkWWA-_dozaEvZKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I am new to buildroot, still going through the documentation and getting my
head around it. I am using a SDK provided by intel for CE5300 which
uses buildroot 2009.05.
The application that I am trying to port on this platform uses network
manager.
I checked latest buildroot 2012.08 also. It seems even that doesn't support
network manager. So how do I achieve Network manager support now.

Do I have to add support for NM and all its dependencies in the buildroot
2009.05 that I have as part of the SDK?
or its easy to upgrade to buildroot 2012.08 and then add NM support? If
upgrade of buildroot is the desired option, is it trivial or a big effort
to get all the packages scripts to migrate through such a big version jump.

-- 
pritam
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121127/3fa051a3/attachment.html>
