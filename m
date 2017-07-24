From: Wolfgang Grandegger <wg@grandegger.com>
Date: Mon, 24 Jul 2017 08:46:03 +0200
Subject: [Buildroot] [PATCH v10 0/3] Make the SDK relocatable
In-Reply-To: <6d6a2f76-7105-4d12-ab38-bd2f8d40a33b@mind.be>
References: <1500722142-20420-1-git-send-email-wg@grandegger.com>
 <20170722144146.28f826b1@windsurf> <8760ejpo9d.fsf@dell.be.48ers.dk>
 <6d6a2f76-7105-4d12-ab38-bd2f8d40a33b@mind.be>
Message-ID: <7d1ae91d-46ed-d2eb-f989-224fc89bb9ca@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout, Peter and Thomas,

Am 23.07.2017 um 14:58 schrieb Arnout Vandecappelle:
> 
> 
> On 23-07-17 10:10, Peter Korsgaard wrote:
>>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>>
>>   > Hello,
>>   > On Sat, 22 Jul 2017 13:15:39 +0200, Wolfgang Grandegger wrote:
>>
>>   >> Wolfgang Grandegger (3):
>>   >> core: introduce "sdk" target to make a relocatable SDK
>>   >> support/scripts/fix-rpath: check if the patchelf utility is executable
>>   >> support/scripts/fix-rpath: typo fix and unneeded ";" removed
>>
>>   > Thanks a lot, I've applied those remaining 3 patches!
>>
>>   > I would like to take this opportunity to thank you for your patience
>>   > and your dedication in pushing this SDK topic. It's been long overdue
>>   > in Buildroot, and the fact that you have taken all comments into
>>   > account and sent quickly new iterations was really instrumental to
>>   > getting the all thing finally merged. So: many thanks!
>>
>> Yes, from me as well - Thanks a lot!

You are welcome! Great that "make sdk" is now mainline! It's useful for 
my/our project as well. Thank you for the fruitful discussions and for 
keeping buildroot up-to-date and robust.

>   And me - thanks again!
> 
>   Do you happen to go to ELC-E in October, or to FOSDEM in February? It would be
> nice to meet at a BR developer meeting.

No plans so far. In case I'm around I would be glad to meet you.

Wolfgang.
