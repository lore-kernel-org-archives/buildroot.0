From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 17 Jul 2017 07:00:49 -0500
Subject: [Buildroot] Autobuilder reporting old build issues
In-Reply-To: <20170717132547.239ba12f@windsurf>
References: <20170715100105.108fb7ab@windsurf>
 <20170716102002.6d570790@windsurf>
 <CANQCQpZtCQzSVZMgt=+qt7DEfMJE3WSPE4EWvM4iA+Rzt=Lh6w@mail.gmail.com>
 <20170717132547.239ba12f@windsurf>
Message-ID: <CANQCQpaH4=_roZ_7HsZjcdA9imo_Jzd23E-C-pQzG5iTF9KVyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Jul 17, 2017 at 6:25 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 17 Jul 2017 06:18:54 -0500, Matthew Weber wrote:
>
>> I had pointed the Buildroot git  remote at our internal mirror because
>> of network issues fetching (this could lead to a delay of ~12hrs or
>> longer if the mirrors can't fetch).  I'll take a look at the
>> autobuilder script and instead of pointing at the mirror, I'll improve
>> error handling of when the remote fails to fetch.  Once this is tested
>> out, I'll respond back.
>
> Have you tried using the github.com mirror instead ?
>

I could definitely try it.  How often does it sync?
