From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Oct 2018 22:20:06 +0200
Subject: [Buildroot] [PATCH] gpsd: fix greis driver build with
 reconfigure disabled
In-Reply-To: <20181009213802.7ef3e645@windsurf>
References: <cb456daa92d4ccbb27a8fcef504f86a77a3a0e74.1539101799.git.baruch@tkos.co.il>
 <20181009213802.7ef3e645@windsurf>
Message-ID: <c5402e83-dac6-d154-8ee9-113f853d9e7f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 9/10/18 21:38, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue,  9 Oct 2018 19:16:39 +0300, Baruch Siach wrote:
>> Add a patch fixing undefined function build failure when reconfigure
>> support is disabled.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/a13/a13a5d852c83cd1fc9f2d1fc2b7302db515278b8/
>> http://autobuild.buildroot.net/results/185/18599ea12a35b9715a67c1f4e5c4e56906235c94/
>> http://autobuild.buildroot.net/results/c00/c00d22a6dcadb82a19afab6eacea654d3c41b4c5/
>>
>> Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>  ...-fix-build-with-reconfigure-disabled.patch | 49 +++++++++++++++++++
>>  1 file changed, 49 insertions(+)
>>  create mode 100644 package/gpsd/0002-driver_greis-fix-build-with-reconfigure-disabled.patch
> 
> Applied to master, thanks. Seems like we're better than upstream at
> testing the different configuration combinations. It's not the first
> time we detect this kind of issues in gpsd.

 Yeah, we should probably ask an upstream developer to be added to the
DEVELOPERS file so they see these issues...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
