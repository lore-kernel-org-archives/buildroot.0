From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 19 Oct 2007 23:32:56 +0200
Subject: [Buildroot] [buildroot 0001537]: kexec doesn't build
	for	arm/armeb
In-Reply-To: <a1a26c05871e60062b21dcb76a88bbe1@busybox.net>
References: <a1a26c05871e60062b21dcb76a88bbe1@busybox.net>
Message-ID: <20071019213256.GA1593@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 17, 2007 at 10:27:31PM -0700, bugs at busybox.net wrote:
>
>The following issue has been RESOLVED. 

Ulf,

If you close a bug, then please CLOSE it, so it doesn't show up as not
closed in mantis.
There are a couple of these that you have to CLOSE. Please do..
Thanks.
>====================================================================== 
>http://busybox.net/bugs/view.php?id=1537 
>====================================================================== 
>Reported By:                hmoffatt
>Assigned To:                buildroot
>====================================================================== 
>Project:                    buildroot
>Issue ID:                   1537
>Category:                   Architecture Specific
>Reproducibility:            always
>Severity:                   minor
>Priority:                   normal
>Status:                     resolved
>Resolution:                 fixed
>Fixed in Version:           
>====================================================================== 
>Date Submitted:             10-16-2007 22:32 PDT
>Last Modified:              10-17-2007 22:27 PDT
>====================================================================== 
>Summary:                    kexec doesn't build for arm/armeb
>Description: 
>kexec doesn't build on arm or armeb.
>
>Problems are:
>1. armeb not a supported architecture;
>2. arm support patch needs to be updated due to an internal API change.
>
>Fix is trivial - attached.
>====================================================================== 
>
>---------------------------------------------------------------------- 
> hmoffatt - 10-17-07 21:43  
>---------------------------------------------------------------------- 
>Use kexec-arm-fix2 instead. It fixes the incorrect syscall number in the
>original source. 
>
>---------------------------------------------------------------------- 
> UlfSamuelsson - 10-17-07 22:27  
>---------------------------------------------------------------------- 
>kexec-arm-fix2 has been applied in revision 20278 
>
>Issue History 
>Date Modified   Username       Field                    Change               
>====================================================================== 
>10-16-07 22:32  hmoffatt       New Issue                                    
>10-16-07 22:32  hmoffatt       Status                   new => assigned     
>10-16-07 22:32  hmoffatt       Assigned To               => buildroot       
>10-16-07 22:33  hmoffatt       File Added: kexec-arm-fix                    
>10-17-07 21:42  hmoffatt       File Added: kexec-arm-fix2                    
>10-17-07 21:43  hmoffatt       Note Added: 0002831                          
>10-17-07 22:27  UlfSamuelsson  Status                   assigned => resolved
>10-17-07 22:27  UlfSamuelsson  Resolution               open => fixed       
>10-17-07 22:27  UlfSamuelsson  Note Added: 0002832                          
>======================================================================
>
>_______________________________________________
>buildroot mailing list
>buildroot at uclibc.org
>http://busybox.net/mailman/listinfo/buildroot
