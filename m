From: Bernhard Fischer <rep.nop@aon.at>
Date: Fri, 17 Nov 2006 16:53:00 +0100
Subject: [Buildroot] buildroot on Debian
In-Reply-To: <87a5b0800611090507i40fbacd9s99642d487e234039@mail.gmail.com>
References: <45532734.90006@computing.dundee.ac.uk>
	<87a5b0800611090507i40fbacd9s99642d487e234039@mail.gmail.com>
Message-ID: <20061117155300.GA28121@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 09, 2006 at 01:07:43PM +0000, Will Newton wrote:
>On 11/9/06, Peter Mendham <petermendham@computing.dundee.ac.uk> wrote:
>> I gave up on cygwin thinking that perhaps I was being an idiot, so I'm
>> now trying Debian.  I'm certainly getting further now, however I hit
>> another snag.  A completely fresh grab of buildroot from SVN this
>> morning errors when trying to build busybox, the makefile says it is
>> looking for Rules.mak in buildroot/build_powerpc/busybox/  Is this to do
>> with the way I have configured things?  I don't understand what it is
>> trying to accomplish.
>
>This seems to be an issue with the svn snapshots of busybox. Try
>deselecting "Use latest busybox snapshot" in the package
>configuration.

Should be fixes as of r16565.
