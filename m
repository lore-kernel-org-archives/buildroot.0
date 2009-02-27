From: Maxim Grigoriev <maxim@tensilica.com>
Date: Fri, 27 Feb 2009 10:44:22 -0800
Subject: [Buildroot] Add $(CONFIG_UPDATE) for a few packages
In-Reply-To: <20090227090702.GD30901@mx.loc>
References: <49A75BE5.3020701@hq.tensilica.com> <20090227090702.GD30901@mx.loc>
Message-ID: <49A83486.8030500@hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for your feedback, Bernhard.

>> Most of these packages should be converted to Makefile.autotools.in

Converting to Makefile.autotools.in is a much bigger job, and it can be 
done later,
meanwhile this simple one line per package patches get our platform to work,
and it's probably helpful to other people.

-- Maxim


Bernhard Reutner-Fischer wrote:
> On Thu, Feb 26, 2009 at 07:20:05PM -0800, Maxim Grigoriev wrote:
>   
>> Hello All,
>>
>> Can somebody review this update, please ?
>>
>> If you decide it's reasonable can you please, go ahead
>> and apply the attached patch ?
>>
>> I don't have write-access to the BUILDROOT repository.
>> So I cannot check it in even after approval.
>>
>> The suggested comment would be :
>>
>> "Add $(CONFIG_UPDATE) calls in all subdirectories that need it for a few packages."
>>     
>
> Most of these packages should be converted to Makefile.autotools.in
> If there is no way to override or add "CONFIG_UPDATE copy to" dirs
> in there then this should be fixed.
>
> Just a thought..
>
>   
