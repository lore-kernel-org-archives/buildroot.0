From: Erik Andersen <andersen@codepoet.org>
Date: Thu, 10 Aug 2006 11:57:49 -0600
Subject: [Buildroot] contrib packages
In-Reply-To: <DDB043F5-416D-4062-AF58-A6295D132D95@cs.auckland.ac.nz>
References: <DDB043F5-416D-4062-AF58-A6295D132D95@cs.auckland.ac.nz>
Message-ID: <20060810175749.GB20615@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu Aug 10, 2006 at 03:13:36PM +1200, Robert Carter wrote:
> I've managed to add a new package to buildroot for ntfsprogs. I've  
> still got some testing to do but I was wondering what is the right  
> way to make my additions available for other developers to use?
> 
> Is a diff of the modified files posted here appropriate or should I  
> be using svn?

Best is to submit a diff (diff -u) vs buildroot and post your
patch to the bug tracking system.  That ensures your patch wont
get lost.  Then, one of the committers (such as myself) will
sometime get around to reviewing your patch and apply it.

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
