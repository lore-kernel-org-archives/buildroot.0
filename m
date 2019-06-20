From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jun 2019 21:50:47 +0200
Subject: [Buildroot] [PATCH 3/4] package: remove non-conventional
 prefix/suffix from github-fetched packages
In-Reply-To: <15a55608-5960-cd35-9462-fa584e6754a8@bootlin.com>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612064209.23619-4-victor.huesca@bootlin.com>
 <f5b97179-ad16-36fc-d1fc-401c81e695e8@mind.be>
 <15a55608-5960-cd35-9462-fa584e6754a8@bootlin.com>
Message-ID: <1d8bf9b2-a578-96ea-eb0b-728818b93014@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/06/2019 14:42, Victor Huesca wrote:
>>  release-monitoring only has openjdk-1.8.0, and calls it java-1.8.0-openjdk.
>>
>>  This is an annoying one, because upstream will create a completely new package
>> for every major release. It kind of makes sense, it's a bit like python2/python3
>> (well, slightly less bad, but not by much). So maybe our package is not
>> correctly named.
>>
>>  Anyway, the release-monitoring versions for java-1.8.0-openjdk are called 8u212
>> and similar. So that's annoying...
> Why not simply add entries on release-monitoring for all version of
> openjdk? There are two options:
> - Add one entry with all version of openjdk (retrived from
> http://jdk.java.net/archive/), the downside is that there is only the
> latest minor/revision of each version and only since version 9...
> - Add multiple entry, one for each major version, this could be easely
> done via the github mirror.
> 
> I could add the entries on next week if this solution looks good to
> everyone.

 Just leave it alone. openjdk is not a priority for Buildroot, it's much more
important for big distros, so let's leave it up to them to create those packages
on release-monitoring.

 Regards,
 Arnout
