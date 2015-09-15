From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Sep 2015 23:22:59 +0200
Subject: [Buildroot] [PATCH v3] Buildroot' patch to add support for
 aarch64 in mplayer configure script
In-Reply-To: <20150915231802.1e19b09c@free-electrons.com>
References: <e6993588b5107e1110e43ed583416f4784933eef.1442336078.git.jpinto@synopsys.com>
 <20150915231802.1e19b09c@free-electrons.com>
Message-ID: <55F88C33.1070503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-09-15 23:18, Thomas Petazzoni wrote:
> Hello Joao,
> 
> Your e-mail is two patches concataned to each other. Can you make that
> a single patch instead?
> 
> Also, the title should be adjusted, as I explained in a previous
> message. See some more comments below.
> 
> On Tue, 15 Sep 2015 18:00:48 +0100, jpinto wrote:
>>
>> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
>> Tested-by: Joao Pinto <jpinto@synopsys.com>
>> ---
>>  package/mplayer/0007-enable-aarch64.patch | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>  create mode 100644 package/mplayer/0007-enable-aarch64.patch
>>
>> diff --git a/package/mplayer/0007-enable-aarch64.patch b/package/mplayer/0007-enable-aarch64.patch
>> new file mode 100644
>> index 0000000..7f75756
>> --- /dev/null
>> +++ b/package/mplayer/0007-enable-aarch64.patch
>> @@ -0,0 +1,13 @@
> 
> All patches in Buildroot should have a description and a Signed-off-by
> line. See
> http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches
> for details.

 Once that is done, could you also send the patch upstream?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
