From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 11:23:01 +0200
Subject: [Buildroot] [git commit] configs/imx6q-sabresd: Drop the 'quad'
 notation
In-Reply-To: <20170927091436.62fd5130@windsurf.home>
References: <20170926222615.730DA8045D@busybox.osuosl.org>
 <20170927091436.62fd5130@windsurf.home>
Message-ID: <f605ff38-a99c-d322-6dc8-a10cd79e00ac@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-09-17 09:14, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 27 Sep 2017 00:26:50 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> commit: https://git.buildroot.net/buildroot/commit/?id=d5935bf70dc89c639bd7e2a7eed0578a7673edca
>> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>
>> Now that SPL is supported a single image can run on the different
>> variants of imx6 sabresd boards: imx6q, imx6dl and imx6qp.
>>
>> So drop the 'quad' prefix from defconfig, directory and readme file
>> to make it generic.
>>
>> Signed-off-by: Fabio Estevam <festevam@gmail.com>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>  .../linux_qt5.fragment                             |  0
>>  .../{imx6q-sabresd => imx6-sabresd}/readme.txt     | 23 +++++++++++++---------
>>  .../rootfs_overlay/root/sabresd.json               |  0
>>  ...6q-sabresd_defconfig => imx6-sabresd_defconfig} |  0
>>  configs/imx6q-sabresd_qt5_defconfig                |  4 ++--
> 
> Isn't this missing an update to .gitlab-ci.yml ?

 Yes indeed, and an update to the developers file as well [1].

 Regards,
 Arnout

[1] https://gitlab.com/buildroot.org/buildroot/pipelines/12176194

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
