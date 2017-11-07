From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Tue, 7 Nov 2017 09:22:18 -0800
Subject: [Buildroot] [PATCH 1/1] .gitlab-ci.yml: use gitlab 9.0 varaible
 names
In-Reply-To: <23b2b26d-93fe-9bbc-9f71-111cf762926f@mind.be>
References: <20171023142614.11522-1-thomas.preston@codethink.co.uk>
 <23b2b26d-93fe-9bbc-9f71-111cf762926f@mind.be>
Message-ID: <16bf5e41-58be-e9dd-842a-8494779f654c@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/11/17 07:00, Arnout Vandecappelle wrote:
> On 23-10-17 16:26, Thomas Preston wrote:
>> Gitlab 9.0 prefers "job" instead of "build" for CI variables names.
>> http://docs.gitlab.com/ce/ci/variables/README.html#9-0-renaming
>>
>> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> 
>   Applied to master, thanks. Good catch! Did you see a warning somewhere or did
> it come naturally after looking at the file?
> 

Just looking at the file, it was my first time using gitlab CI. :)

Thanks
