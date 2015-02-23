From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 Feb 2015 13:42:35 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-02-22
In-Reply-To: <20150223134000.7f3f3c5b@free-electrons.com>
References: <20150223073016.4059D1027D4@stock.ovh.net>	<54EAFCAA.5070506@imgtec.com>	<20150223122336.2de88dc7@free-electrons.com>	<54EB1E71.5030904@imgtec.com>
 <20150223134000.7f3f3c5b@free-electrons.com>
Message-ID: <54EB203B.7070107@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I will try that trick. Thanks for the hint :-)

--
Vincent

On 23/02/15 13:40, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Mon, 23 Feb 2015 13:34:57 +0100, Vicente Olivert Riera wrote:
> 
>> Yes, that was fixes 6 months ago by this commit:
>>
>> https://gitlab.com/bminor/mesa-mesa/commit/5a4e0f3873657d874eb5ff52819f42ea38d54b91.patch
>>
>> We could do a similar fix for openswan. The problem is I can't reproduce
>> the failure so I wouldn't be able to test that fix to check if it works
>> or not.
> 
> Did you try something like:
> 
> while true ; do make openswan-dirclean ; make openswan || exit 1 ; done
> 
> with a high BR2_JLEVEL value ? That's typically how I manage to
> reproduce parallel build issues.
> 
> Thanks,
> 
> Thomas
> 
