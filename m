From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Mar 2015 23:23:39 +0100
Subject: [Buildroot] package/glog
In-Reply-To: <CAGm1_kv3ArTGv2W9usiUdYOsVF1_kksZ7xjZ2GVAQtKYbczy3Q@mail.gmail.com>
References: <1427161798142.23284@uqconnect.edu.au>
 <1427170586986.25469@uqconnect.edu.au>
 <CAGm1_kv3ArTGv2W9usiUdYOsVF1_kksZ7xjZ2GVAQtKYbczy3Q@mail.gmail.com>
Message-ID: <5515D86B.8080009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/03/15 22:20, Yegor Yefremov wrote:
> Hi Anthony,
> 
> thanks for your contribution. Below my comments.
> 
> On Tue, Mar 24, 2015 at 5:16 AM, Mr Anthony Arnold
> <anthony.arnold@uqconnect.edu.au> wrote:
>> Signed-off-by: Anthony Arnold <anthony.arnold@uqconnect.edu.au>
>> ---
>>  package/Config.in      |  1 +
>>  package/glog/Config.in | 11 +++++++++++
>>  package/glog/glog.mk   | 13 +++++++++++++
> 
> Please add a hash file
> (http://nightly.buildroot.org/manual.html#adding-packages-hash)

 Actually, no. It's missing in the manual, but hash files should not be added
for packages using the github helper. The problem is that the archive is created
on the fly, and will be different at different times (even for the same commit).

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
