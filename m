From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 17 Jul 2017 08:20:32 -0500
Subject: [Buildroot] Autobuilder reporting old build issues
In-Reply-To: <20170717140930.0f8072b0@windsurf>
References: <20170715100105.108fb7ab@windsurf>
 <20170716102002.6d570790@windsurf>
 <CANQCQpZtCQzSVZMgt=+qt7DEfMJE3WSPE4EWvM4iA+Rzt=Lh6w@mail.gmail.com>
 <20170717132547.239ba12f@windsurf>
 <CANQCQpaH4=_roZ_7HsZjcdA9imo_Jzd23E-C-pQzG5iTF9KVyQ@mail.gmail.com>
 <20170717140930.0f8072b0@windsurf>
Message-ID: <CANQCQpaC7fMNRUrOZtHgs+CA8tXoDB9v4f9UWeHAgNRor0A7zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Jul 17, 2017 at 7:09 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 17 Jul 2017 07:00:49 -0500, Matthew Weber wrote:
>
>> > Have you tried using the github.com mirror instead ?
>>
>> I could definitely try it.  How often does it sync?
>
> Every 10 minutes.
>

I've updated to use the github mirror and a test run looks good.  When
my builder cron starts later this evening  (11pm UTC), it will be
using this new config.

Thanks for pointing this out, it was on my list to revisit but I
needed a push :-)  This is obviously good to have fixed and I've got a
couple more idle machines that will start contributing next month once
I get them setup.

Matt
