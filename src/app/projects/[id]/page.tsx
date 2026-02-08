import ProjectDetailsClient from './ProjectDetailsClient';

export const runtime = 'edge';

export default function Page({ params }: { params: Promise<{ id: string }> }) {
  return <ProjectDetailsClient params={params} />;
}
