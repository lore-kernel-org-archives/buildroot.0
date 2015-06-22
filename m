From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 22 Jun 2015 12:50:27 +0200
Subject: [Buildroot] CMake and VERBOSE variable
In-Reply-To: <4fd6c4c54bc90972d20b6f04b62b227e@openmailbox.org>
References: <9943347198fceae1227501e1d00f818a@openmailbox.org>
 <5578B394.1010503@mind.be> <a5c10080f12174d721c5f1ebad30b3f1@openmailbox.org>
 <5579E9EF.4070402@mind.be> <0d88f0bd848eeb62c868dc2d5dffe496@openmailbox.org>
 <55870F2F.4080700@mind.be> <4fd6c4c54bc90972d20b6f04b62b227e@openmailbox.org>
Message-ID: <CAHXCMMJWjiKVCi-vjWftDgAxq7JDN+You3Go-NCvQVS81AC1Cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Mon, Jun 22, 2015 at 11:47 AM, C?dric Marie
<cedric.marie@openmailbox.org> wrote:
> Hi,
>
> Le 2015-06-21 21:23, Arnout Vandecappelle a ?crit :
>>
>>  I propose to do it in two patches:
>>
>> - a first patch that removes the export of VERBOSE, with the commit log
>> explaining how it breaks cmake projects;

Does this mean that the VERBOSE env. var. should now be handled by the
cmake-infra?

>>
>> - a second patch that removes the export of all the rest, with the commit
>> log
>> explaining that there is no reason to export it and that it was just
>> inherited
>> from Kbuild.
>>
>>  Can you do that?
>
>
>
> OK, I will do that.
>
> Regards,

Regards,

-- 
Samuel
