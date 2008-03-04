From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 4 Mar 2008 09:18:12 +0100
Subject: [Buildroot] more stuff for buildroot
References: <46a136670803031657g5520b45s7026145d87d168a5@mail.gmail.com>
	<20080304030153.GA4416@cloud.net.au>
Message-ID: <00c201c87ddb$1b1cc800$060514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Mon, Mar 03, 2008 at 07:57:41PM -0500, John Voltz wrote:
>> I dropped in here a couple of weeks ago to offer some new stuff for
>> buildroot. I think most of my ugly work is now fixed, so if somebody
>> is interested in pulling from subversion, here's the link (below). I
> 
> Can you send patches? SVN doesn't support "pulling" a la git, so it
> isn't possible to merge your changes in automatically. The proper
> protocol is to send patches to this list, ideally broken up into blocks
> of related changes.
> 
> By the way, the description of your googlecode project is rather
> provocative:
> "The intention of this project is to fork the buildroot
> project to allow easier developer access. It is originally based on the
> buildroot daily snapshot 20080211."
> 
> In what way does the current arrangement on uclibc.org constrain
> developer access? You don't appear to have ever posted to this list
> until last month, barely before that 20080211 date.
> 

I do not see that there is a problem using a separate svn to develop 
and test code in a separate svn, before it is sent in as a patch,
so let's not start a war.

John has done a lot of good work for the AVR32 specific buildroot,
including getting X11R7 working. I do think we want his contribution.

It should be done in the form of separate patches though.

I assume that if people like what he provides, he can get
write access to the main svn pretty soon and then there
should be no problems.

Best Regards
Ulf Samuelsson
