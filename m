From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 11 Jan 2019 00:52:09 -0200
Subject: [Buildroot] [PATCH 3/3] .gitlab-ci.yml: add trigger per job
References: <CANQCQpZOEf+ofp5i6gyZG5qiObcenhLNKSutETfyWiP3JzA75Q@mail.gmail.com>
Message-ID: <5c3804d9c9bdb_7b6b3f9bfc15c27869f0@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Jan 09, 2019 at 12:57 PM, Matthew Weber wrote:

> On Thu, Dec 13, 2018 at 10:55 AM Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>>
>> On Mon, Dec 10, 2018 at 7:30 AM Matthew Weber
>> <matthew.weber@rockwellcollins.com> wrote:
[snip]
>>
>> I was thinking about adding a section in the manual describing how to
>> setup a gitlab fork and the cronjobs to trigger runtime and defconfig
>> cases.  Then a person submitting new defconfigs and test cases could
>> setup their own CI to monitor and track failures.

... and also easily test the new defconfig or test case using the Gitlab CI
even before submitting.

I think this new section to the manual would be useful.

>>
>> Is that a direction that makes sense to promote as possibly a way to
>> get more visibility to CI failures?
>>
> 
> Do you think you'll be sending an updated patchset for this feature?
> I can see this enabling others to setup gitlab tests for their
> defconfigs they support.

Sorry the long delay on this topic.
I think I will have some time to implement Thomas' suggestions in the next 1 or
2 weekends.
But please feel free to take over if you want (and have the time now).


Regards,
Ricardo
