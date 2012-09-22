From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 15:28:20 +0200
Subject: [Buildroot] Buildroot configuration usage
In-Reply-To: <505DAE69.8090603@alice.it> (p.'s message of "Sat, 22 Sep 2012
 14:26:17 +0200")
References: <505DAE69.8090603@alice.it>
Message-ID: <87obkychl7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "p" == p virgili67 <p.virgili67@gmail.com> writes:

 p> Dear Peter,

Hi,

Please send Buildroot questions to the buildroot list
(buildroot at uclibc.org) instead of directly to me in the future, thanks.

 p> I need to signal you a strange behaviours of buildroot: if I select
 p> Load an Alternate Configuration File and press <ENTER> nothing
 p> happen.  I try to select other sub menu, but when I press <ENTER>,
 p> nothing happen. All other key are working right, ENTER don't work
 p> (only in this context).  Have you some suggestion for me.  I need to
 p> load an Aaternate configuration file from an hardware
 p> provider. there is anoter way to load this file in my build root
 p> packet.  Some other information: LINUX distribution is last ubuntu
 p> downloaded by ubuntu web page, installe in a virtual machine inside
 p> VMWare 8.0.4.

What Buildroot version are you using? It seems to work ok here with
latest git.

As a workaround you could always copy your alternative configuration to
.config in the buildroot dir before running make menuconfig.


-- 
Bye, Peter Korsgaard
