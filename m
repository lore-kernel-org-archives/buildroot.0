From: Anders Gabert <anga@syntronic.com>
Date: Tue, 22 Feb 2011 09:10:07 +0100 (CET)
Subject: [Buildroot] Problem when running a Qt program on AT91SAM9M10
In-Reply-To: <1411107015.845.1298361874825.JavaMail.root@Tesla.Syntronic.com>
Message-ID: <1759946353.864.1298362207553.JavaMail.root@Tesla.Syntronic.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi 

I have a problem when running a Qt example program on AT91SAM9M10. 

I?m using Buildroot 2010.11 and have selected and compiled Qt. 
I get a bunch of Qt libs under usr/lib. 

To test Qt I have compiled the calculator under the example widgets when running it on 
the unit a get the error below. As you can see there are characters missing in the error text. 
When looking in the Qt code, I think the last line should be 
?Cannot create Qt for Embedded Linux data directory: %s?. 
Has anyone had the same problem or a solution to it. 

# ./calculator -qws 
QString::arg: Argument missing: "/proc/%1/exe" , 384 
Qtig:r:Agmn isn:"po/1ee 8 ? 
Qtig:r:Agmn isn:"po/1ee 8 ? 
Qtig:r:Agmn isn:%ted,/ 
Qtig:r:Agmn isn:"1qebde-2 ????? 
Cno raeQ o meddLnxdt ietr:%ted 
Aborted 
# 

//Anders 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110222/ee0f23ae/attachment.html>
