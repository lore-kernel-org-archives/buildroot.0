From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Apr 2015 23:02:42 +0200
Subject: [Buildroot] [PATCH 2/3] python-pyqt: fix install
In-Reply-To: <20150420174549.5033a947@x230.trabucayre.com>
References: <1429543759-32207-1-git-send-email-gwenj@trabucayre.com>
 <1429543759-32207-2-git-send-email-gwenj@trabucayre.com>
 <20150420173752.153476a6@free-electrons.com>
 <20150420174549.5033a947@x230.trabucayre.com>
Message-ID: <55356972.9020905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/04/15 17:45, gwenhael.goavec wrote:
> Dear Thomas Petazzoni,
> 
> On Mon, 20 Apr 2015 17:37:52 +0200
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
>> Dear Gwenhael Goavec-Merou,
>>
>> On Mon, 20 Apr 2015 17:29:18 +0200, Gwenhael Goavec-Merou wrote:
>>> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>>>
>>> PyQt4 provides two version for some py files: one for python2.x and one for
>>> python3.x. This two versions are installed in TARGET_DIR.
>>> After installing files, python is used to generate all .pyc files, but fails
>>> like :
>>> class ProxyBase(metaclass=ProxyMetaclass):
>>>                              ^
>>> 							 SyntaxError: invalid syntax
>>
>> I did not encounter this issue when testing. With which configuration
>> do you get this problem?
>>
> I have used the defconfig provided by :
> http://autobuild.buildroot.net/results/e2a/e2ab7e2e61aaa5758a3a572ae25a047e802fdcc0/

 When you submit a patch that fixes an autobuild failure, you should mention
that in the commit log, like:

Fixes:
http://autobuild.buildroot.net/results/e2a/e2ab7e2e61aaa5758a3a572ae25a047e802fdcc0/



 Regards,
 Arnout


> 
>> Thanks,
>>
>> Thomas
> 
> Regards,
> Gwen
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
